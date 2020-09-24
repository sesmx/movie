<template>
  <header id="site-header" class="w3l-header fixed-top">
    <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
      <div class="container">
        <h1>
          <router-link class="navbar-brand" to="/" exact
            ><span class="fa fa-play icon-log" aria-hidden="true"></span>
            Movies
          </router-link>
        </h1>
        <button
          class="navbar-toggler collapsed"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="fa icon-expand fa-bars"></span>
          <span class="fa icon-close fa-times"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto">
            <li v-for="menu in menuItems" class="nav-item" :key="menu.name">
              <router-link class="nav-link" :to="menu.link" exact>{{
                menu.name
              }}</router-link>
            </li>
          </ul>
          <div class="search-right">
            <a
              href="#search"
              class="btn search-hny mr-lg-3 mt-lg-0 mt-4"
              title="search"
              >Search <span class="fa fa-search ml-3" aria-hidden="true"></span
            ></a>
            <div id="search" class="pop-overlay">
              <div class="popup">
                <form action="#" method="post" class="search-box">
                  <input
                    type="search"
                    placeholder="Search your Keyword"
                    name="search"
                    required="required"
                    autofocus=""
                  />
                  <button class="btn">
                    <span class="fa fa-search" aria-hidden="true"></span>
                  </button>
                </form>
                <div class="browse-items">
                  <h3 class="hny-title two mt-md-5 mt-4">Browse all:</h3>
                  <ul class="search-items">
                    <li><a href="javascript:void(0);">Action</a></li>
                    <li><a href="javascript:void(0);">Drama</a></li>
                    <li><a href="javascript:void(0);">Family</a></li>
                    <li><a href="javascript:void(0);">Thriller</a></li>
                    <li><a href="javascript:void(0);">Romantic</a></li>
                    <li><a href="javascript:void(0);">Tv-Series</a></li>
                    <li><a href="javascript:void(0);">Horror</a></li>
                  </ul>
                </div>
              </div>
              <a class="close" href="#close">&times;</a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  name: "header-nav",
  data() {
    return {
      menuItems: []
    };
  },
  created() {
    this.$router.options.routes.forEach(route => {
      if (route.path !== "*" && route.path !== "/moviedetail/:id") {
        this.menuItems.push({
          name: route.meta.title,
          link: route.path
        });
      }
    });
  }
};
</script>

<style scoped>
.search-right .popup form input[type="search"] {
  padding: 15px 45px 15px 15px;
  border: none;
  background: #fff;
  color: var(--theme-title);
  font-size: 16px;
  border-radius: 6px;
  margin: 0;
  text-align: left;
  height: 60px;
  width: 100%;
}
[type="search"] {
  outline-offset: -2px;
  -webkit-appearance: none;
}
</style>
