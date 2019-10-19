package com.Sales.SalesWeb.model.POJO;

import com.Sales.SalesWeb.model.Product;
import com.fasterxml.jackson.annotation.*;

import java.util.HashMap;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "sucsessfull",
        "product"
})
public class PostDefaultResponse {
    @JsonProperty("sucsessfull")
private boolean sucsessfull;
        @JsonProperty("product")
        private Object product;
        @JsonIgnore
        private Map<String, Object> additionalProperties = new HashMap<String, Object>();

        @JsonProperty("sucsessfull")
        public boolean getSucsessfull() {
            return sucsessfull;
        }

        @JsonProperty("sucsessfull")
        public void setSucsessfull(boolean sucsessfull) {
            this.sucsessfull = sucsessfull;
        }

        @JsonProperty("product")
        public Object getProduct() {
            return product;
        }

        @JsonProperty("product")
        public void setProduct(Product product) {
            this.product = product;
        }

        @JsonAnyGetter
        public Map<String, Object> getAdditionalProperties() {
            return this.additionalProperties;
        }

        @JsonAnySetter
        public void setAdditionalProperty(String name, Object value) {
            this.additionalProperties.put(name, value);
        }

}
