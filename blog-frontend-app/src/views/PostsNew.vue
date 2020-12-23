<template>

  <div class="posts-new">
    <form v-on:submit.prevent="submit()">
      <img v-if="status" v-bind:src="`https://http.cat/${status}`" width="700px">
      <h1>Make a New Post</h1>
      <ul>
        <li class="text-danger" v-for="error in errors">{{ error }}</li>
      </ul>
      <div class="form-group">
        <label>Title:</label> 
        <input type="text" class="form-control" v-model="user_id">
      </div>
      <div class="form-group">
        <label>Ingredients:</label>
        <input type="text" class="form-control" v-model="title">
      </div>
      <div class="form-group">
        <label>Directions:</label>
        <input type="text" class="form-control" v-model="body">
      </div>
      <div class="form-group">
        <label>Prep Time:</label>
        <input type="text" class="form-control" v-model="image">
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
      user_id: "",
      title: "",
      body: "",
      image: "",
      errors: [],
      status: "",
    };
  },
  methods: {
    submit: function () {
      var params = {
        user_id: this.user_id,
        title: this.title,
        body: this.body,
        image: this.image,
      };
      axios
        .post("/api/posts", params)
        .then((response) => {
          this.$router.push("/posts");
        })
        .catch((error) => {
          this.errors = error.response.data.errors;
          console.log(error.response.status);
          this.status = error.response.status;
        });
    },
  },
};
</script>

