<template>
  <div id="app">
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/posts/">New Post</a>
            </li>
            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li v-if="!isLoggedIn()"><a class="dropdown-item" href="/login">Login</a></li>
                <li v-if="isLoggedIn()"><a class="dropdown-item" href="/logout">Logout</a></li>
                <li><hr class="dropdown-divider"></li>
                <li v-if="!isLoggedIn()"><a class="dropdown-item" href="/signup">Signup</a></li>
              </ul>
            </li> -->
            <li class="nav-item">
              <a class="nav-link active" href="/login">Login</a>
            </li>
          </ul>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav> 
    <router-view/>
  </div>
</template>

<style>
body {
  font-family: Futura;
  /* background-image: url('./assets/moroccan-flower-dark.png'); */
}
</style>
<script lang="ts">
export default {};
</script>
