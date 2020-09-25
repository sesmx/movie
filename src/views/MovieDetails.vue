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
      this.selectedMovie = this.$store.state.movies.find(
        x => x.id === this.$route.params.id
      );
      this.selectedMovie = this.$func.searchByMovieId(
        this.$route.params.id,
        this.$store.state.movies
      );
      if (this.selectedMovie === undefined || this.selectedMovie === null) {
        this.$router.push({ path: "/" });
      }
    }
  }
};
</script>

<style scoped></style>
