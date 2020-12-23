<template>
  <div class="home">
    <hr>
    <h1>INDEX</h1>
    <hr>
    <p>Search titles: <input type="list" v-model='search' label='bodies'></p>
      <select name="bodies" id="bodies" v-model='searchBody'>
      <option value="3">3</option>
      <option value="8">8</option>
      </select>
     <div v-for="post in filterBy(filterBy(posts, search , 'title'), searchBody , 'body')">
      <p><h3>{{ post.title }}</h3></p>
      <p>{{ post.body}}</p>
      <hr>
    </div>
  </div>
</template>

<style>
</style>

<script>
import axios from "axios";
import Vue2Filters from "vue2-filters";

export default {
  mixins: [Vue2Filters.mixin],
  data: function () {
    return {
      message: "Welcome to Vue.js!",
      posts: [],
      title: "",
      body: "",
      user_id: "",
      image: "",
      currentPost: {},
      errors: [],
      search: "a",
      searchBody: "kombucha",
    };
  },
  created: function () {
    console.log("in created");
    this.postsIndex();
  },
  methods: {
    postsIndex: function () {
      console.log("posts index..");
      axios.get("/api/posts").then((response) => {
        console.log(response.data);
        this.posts = response.data;
      });
    },
    // createPost: function () {
    //   console.log("creating post...");
    //   var params = {
    //     title: this.title,
    //     body: this.body,
    //     user_id: this.user_id,
    //     image: this.image,
    //     image_url: this.image_url,
    //   };
    //   axios
    //     .post("/api/posts", params)
    //     .then((response) => {
    //       console.log(response.data);
    //       this.posts.push(response.data);
    //     })
    //     .catch((error) => {
    //       console.log("you messed up");
    //       console.log(error.response.data.errors);
    //       // show user errors
    //       this.errors = error.response.data.errors;
    //     });
    // },
    // updatePost: function () {
    //   var params = {
    //     title: this.currentPost.title,
    //     user_id: this.currentPost.user_id,
    //     body: this.currentPost.body,
    //     image_url: this.currentPost.image_url,
    //     image: this.currentPost.image,
    //   };

    //   console.log("updating post...");
    //   axios
    //     .patch("/api/posts/" + this.currentPost.id, params)
    //     .then((response) => {
    //       console.log(response.data);
    //     });
    // },
    // showPost: function (thePost) {
    //   console.log(thePost);
    //   this.currentPost = thePost;
    //   console.log("show post...");
    //   document.querySelector("#post-details").showModal();
    // },
    // destroyPost: function () {
    //   console.log("destroy post...");
    //   // making the correct request to rails
    //   axios.delete("/api/posts/" + this.currentPost.id).then((response) => {
    //     console.log(response.data);
    //     // remove the post from the array
    //     // find the correct index in the array
    //     var index = this.posts.indexOf(this.currentPost);
    //     console.log(index);
    //     // delete at that index
    //     this.posts.splice(index, 1);
    //   });
    // },
  },
};
</script>