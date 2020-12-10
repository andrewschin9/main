<template>
  <div class="home">
    <h1>Products</h1>
    <ul id="products">
      <li v-for="product in products" :key="products.name">
        {{ product.name }}
      </li>
    </ul>
  </div>
</template>
<style>
</style>
<script>
export default {
  data: function () {
    return {
      message: "Products",
      products: [
        { id: 1, name: "Eggs", price: 12 },
        { id: 2, name: "Cheese", price: 7 },
        { id: 3, name: "Bread", price: 2 },
      ],
    };
  },
  created: function () {},
  methods: {},
};
</script>