<template>
  <section class="w3l-grids">
    <div class="grids-main py-5">
      <div class="container py-lg-4">
        <div class="headerhny-title">
          <div class="w3l-title-grids">
            <div class="headerhny-left">
              <h3 class="hny-title">Now Showing</h3>
            </div>
          </div>
        </div>
        <div class="owl-three owl-carousel owl-theme">
          <div v-for="movie in movies" :key="movie.id" class="item vhny-grid">
            <div class="box16">
              <a href="javascript:void(0);">
                <figure>
                  <img
                    class="img-fluid"
                    :src="movie.posterUrl"
                    :alt="movie.movieTitle"
                  />
                </figure>
                <div class="box-content">
                  <h4>
                    <span class="post"
                      ><span class="fa fa-clock-o"> </span> 2 Hr 4min
                    </span>

                    <span class="post fa fa-heart text-right"></span>
                  </h4>
                </div>
                <span class="fa fa-play video-icon" aria-hidden="true"></span>
              </a>
            </div>
            <h3>
              <a class="title-gd" href="javascript:void(0);">{{
                movie.movieTitle
              }}</a>
            </h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
            <div class="button-center text-center mt-4">
              <a href="javascript:void(0);" class="btn watch-button"
                >View Details</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      movies: []
    };
  },
  created() {
    this.getAllMovies();
  },
  methods: {
    getAllMovies() {
      const _vm = this;
      let url = _vm.$store.state.apiRoot + "/api/Movie/GetAll";
      _vm.$axios.get(url).then(function(resp) {
        _vm.movies = resp.data;
        console.log(_vm.movies);
      });
    }
  }
};
</script>
