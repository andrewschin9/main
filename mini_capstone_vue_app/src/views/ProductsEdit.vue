<template>
  <div class="products-edit">
    <form v-on:submit.prevent="submit()">
      <h1>Edit a Product</h1>
      <ul>
        <li class="text-danger" v-for="error in errors">{{ error }}</li>
      </ul>
      <div class="form-group">
        <label>Title:</label> 
        <input type="text" class="form-control" v-model="product.name">
      </div>
      <div class="form-group">
        <label>Ingredients:</label>
        <input type="text" class="form-control" v-model="product.description">
      </div>
      <div class="form-group">
        <label>Directions:</label>
        <input type="text" class="form-control" v-model="product.price">
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
      product: {},
      errors: [],
    };
  },
  created: function () {
    console.log("in created...");
    this.getProductData();
  },
  methods: {
    submit: function () {
      var params = {
        title: this.product.title,
        ingredients: this.product.ingredients,
        directions: this.product.directions,
        prep_time: this.product.prep_time,
        image_url: this.product.image_url,
      };
      axios
        .patch("/api/products/" + this.$route.params.id, params)
        .then((response) => {
          this.$router.push("/products/" + this.$route.params.id);
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
        });
    },
    getProductData: function () {
      // get data to prepopulate the form
      axios.get("/api/products/" + this.$route.params.id).then((response) => {
        console.log(response.data);
        this.product = response.data;
        // this.title = response.data.title;
        // this.ingredients = response.data.ingredients;
        // this.directions = response.data.directions;
        // this.prepTime = response.data.prep_time;
        // this.imageUrl = response.data.image_url;
      });
    },
  },
};
</script>