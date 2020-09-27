<template>
  <div>
    <movie-detail :movieobj="selectedMovie"></movie-detail>
    <movie-stills :moviestills="selectedMovie"></movie-stills>
  </div>
</template>

<script>
import MovieDetail from "@/components/moviedetails/movie-detail";
import MovieStills from "@/components/moviedetails/movie-stills";
export default {
  name: "MovieDetails",
  data() {
    return {
      selectedMovie: {}
    };
  },
  components: {
    MovieStills,
    MovieDetail
  },
  created() {
    this.initMovie();
  },
  watch: {
    // eslint-disable-next-line no-unused-vars
    $route(to, from) {
      this.initMovie();
    }
  },
  methods: {
    initMovie() {
      const _vm = this;
      if (_vm.$store.state.movies.length <= 0) {
        let url =
          _vm.$store.state.apiRoot +
          "/api/Movie/GetOne?id=" +
          _vm.$route.params.id;
        _vm.$axios.get(url).then(function(resp) {
          _vm.selectedMovie = resp.data;
        });
      } else {
        _vm.selectedMovie = _vm.$func.searchByMovieId(
          _vm.$route.params.id,
          _vm.$store.state.movies
        );
      }
      _vm.carouselPostCall();
      if (
        _vm.selectedMovie === undefined ||
        _vm.selectedMovie === null ||
        _vm.selectedMovie.id <= 0
      ) {
        _vm.$router.push({ path: "/" });
      }
    },
    carouselPostCall() {
      this.$nextTick(function() {
        // eslint-disable-next-line no-undef
        $(".owl-two").owlCarousel({
          loop: true,
          margin: 40,
          nav: false,
          responsiveClass: true,
          autoplay: true,
          autoplayTimeout: 5000,
          autoplaySpeed: 1000,
          autoplayHoverPause: false,
          responsive: {
            0: {
              items: 1,
              nav: false
            },
            480: {
              items: 2,
              nav: true
            },
            667: {
              items: 2,
              margin: 20,
              nav: true
            },
            1000: {
              items: 3,
              nav: true
            }
          }
        });
      });
    }
  }
};
</script>

<style scoped></style>
