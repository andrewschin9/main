<template>
  <div class="home">
    <h1>Products</h1>
  <!-- Loop for displaying products -->
  <div v-for="product in products">
    {{product.name}}
    <p><img v-bind:src = "product.image_url" v-bind:alt="product.name"></p>
    <button v-on:click = "showProduct(product)">Show more info</button>
    <hr>

    <dialog id="product-details">
      <form method = "dialog">
        <p><strong>Name:</strong> <input type = "text" v-model = "currentProduct.name"></p>
        <p><strong>Price:</strong> <input type = "text" v-model = "currentProduct.price"></p>
        <p><strong>Description:</strong> <input type = "text" v-model = "currentProduct.description"></p>
        <p><strong>Image_URL:</strong> <input type = "text" v-model = "currentProduct.image_url"></p>
        <button>Close</button>
        <button v-on:click = "updateProduct()">Update</button>
        <button v-on:click = "destroyProduct()">Delete Product</button>
      </form>
    </dialog>
  </div>
  <!-- Loop for displaying products^ -->

  <!-- Create a product -->
  <h2>Make a new product</h2>
  <p>Name: <input type="text" v-model = "name"></p>
  <p>Description: <input type="text" v-model = "description"></p>
  <p>Price: <input type = "text" v-model = "price"></p>
  <p>Image URL: <input type = "text" v-model = "image_url"></p>  
  <button v-on:click = "createProduct()">Make Product</button>
  <!-- Create a product^ -->
  </div>

</template>
<style>
</style>
<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Products",
      products: [],
      showInfo: false,
      name: "",
      description: "",
      price: "",
      image_url: "",
      currentProduct: {},
    };
  },
  created: function () {
    this.getData();
  },
  methods: {
    getData: function () {
      axios.get("http://localhost:3000/api/products").then((response) => {
        this.products = response.data;
      });
    },
    createProduct: function () {
      var params = {
        name: this.name,
        description: this.description,
        price: this.price,
        image_url: this.image_url,
      };
      axios
        .post("http://localhost:3000/api/products", params)
        .then((response) => {
          this.products.push(response.data);
        });
    },
    updateProduct: function () {
      var params = {
        name: this.currentProduct.name,
        description: this.currentProduct.description,
        price: this.currentProduct.price,
        image_url: this.currentProduct.image_url,
      };
      axios
        .patch(
          "http://localhost:3000/api/products/" + this.currentProduct.id,
          params
        )
        .then((response) => {
          response.data;
        });
    },
    showProduct: function (product) {
      this.currentProduct = product;
      document.querySelector("#product-details").showModal();
    },
    destroyProduct: function () {
      axios
        .delete("http://localhost:3000/api/products/" + this.currentProduct.id)
        .then((response) => response.data);
      var index = this.products.indexOf(this.currentProduct);
      this.products.splice(index, 1);
    },
  },
};
</script>