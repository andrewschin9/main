<template>

  <div class="products-new">
    <form v-on:submit.prevent="submit()">
      <h1>Make a new Product</h1>
      <ul>
        <li class="text-danger" v-for="error in errors">{{ error }}</li>
      </ul>
      <div class="form-group">
        <label>Name:</label> 
        <input type="text" class="form-control" v-model="name">
      </div>
      <div class="form-group">
        <label>Description:</label>
        <input type="text" class="form-control" v-model="description">
      </div>
      <div class="form-group">
        <label>Price:</label>
        <input type="text" class="form-control" v-model="price">
      </div>
      <div class="form-group">
        <label>Image URL:</label>
        <input type="text" class="form-control" v-model="imageUrl">
      </div>
      <input type="submit" class="btn btn-primary" value="Submit">
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      name: "",
      description: "",
      price: "",
      image_url: "",
      errors: [],
    };
  },
  methods: {
    submit: function () {
      var params = {
        name: this.name,
        description: this.description,
        price: this.price,
        image_url: this.image_url,
      };
      axios
        .post("/api/products", params)
        .then((response) => {
          this.$router.push("/products");
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        });
    },
  },
};
</script>