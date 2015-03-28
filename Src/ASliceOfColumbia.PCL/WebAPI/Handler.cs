using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using ASliceOfColumbia.PCL.Transports;

using Newtonsoft.Json;

namespace ASliceOfColumbia.PCL.WebAPI {
    public class Handler {
        private async Task<K> send<T, K>(string urlArguments, T obj) {
            try {
                var client = new HttpClient();

                var address = new Uri(String.Format(PCL.Common.Constants.WEBAPI_ADDRESS + "{0}", urlArguments));
                var content = new System.Net.Http.StringContent(JsonConvert.SerializeObject(obj), Encoding.UTF8, "application/json");

                var response = await client.PostAsync(address, content);

                var data = await response.Content.ReadAsStringAsync();

                return JsonConvert.DeserializeObject<K>(data);
            } catch (Exception ex) {
                // Replace this return with a call to the database to record the error and/or send an email out to let the developers know an error occurred
                return JsonConvert.DeserializeObject<K>(ex.ToString());
            }
        }

        public async Task<List<LocationResponseItem>> SubmitRequest(LocationRequestItem requestItem) {
            return await send<LocationRequestItem, List<LocationResponseItem>>("MobileRequest", requestItem);
        } 
    }
}