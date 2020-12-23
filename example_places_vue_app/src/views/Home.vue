<template>
  <div class="home">
    <!-- Create -->
    <h1> Add a Place</h1>
    <p>Name: <input type="text" v-model = "name"></p>
    <p>Address: <input type="text" v-model = "address"></p>
    <button v-on:click = "createPlace()">Add</button>
    <!--  -->
    <!-- Index -->
    <h1>List of Places</h1>
    <div v-for="place in places">
      <hr>
      <p><strong>NAME:</strong> {{place.name}}</p>
      <p><strong>ADDRESS:</strong> {{place.address}}</p>
      <button v-on:click = "popup(place)">Delete</button>
      <hr>
      <dialog id="place-message">
        <form method = "dialog">
        <p>Are you sure?</p>
        <button v-on:click = "destroyPlace()">Really Delete</button>
        <button>Close</button>
        </form>
      </dialog>
    </div>
    <!--  -->

  </div>
</template>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Places",
      places: [],
      name: "",
      address: "",
      currentPlace: {},
    };
  },
  created: function () {
    this.index();
  },
  methods: {
    index: function () {
      axios.get("api/places").then((response) => {
        this.places = response.data;
      });
    },
    createPlace: function () {
      var params = {
        name: this.name,
        address: this.address,
      };
      axios.post("api/places", params).then((response) => {
        this.places.push(response.data);
      });
    },
    popup: function (place) {
      this.currentPlace = place;
      console.log(this.currentPlace);
      document.querySelector("#place-message").showModal();
    },
    destroyPlace: function () {
      console.log(this.currentPlace.id);
      axios
        .delete("api/places/" + this.currentPlace.id)
        .then((response) => response.data);
      var index = this.places.indexOf(this.currentPlace);
      this.places.splice(index, 1);
    },
  },
};
</script>
