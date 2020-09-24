<template>
  <div class="w3l-ab-grids py-5">
    <div class="container py-lg-4">
      <div class="row ab-grids-sec align-items-center">
        <div class="col-lg-6 ab-right">
          <img
            width="300"
            class="img-fluid"
            :src="movieobj.posterUrl"
            :alt="movieobj.movieTitle"
          />
        </div>
        <div class="col-lg-6 ab-left pl-lg-4 mt-lg-0 mt-5">
          <h3 class="hny-title">{{ movieobj.movieTitle }}</h3>
          <p class="mt-3">{{ movieobj.plot }}</p>
          <div class="ready-more mt-4">
            <a href="#" class="btn read-button"
              >Book Ticket
              <span
                class="fa fa-angle-double-right ml-2"
                aria-hidden="true"
              ></span
            ></a>
          </div>
        </div>
      </div>
      <div class="w3l-counter-stats-info text-center">
        <div class="stats_left">
          <div class="counter_grid">
            <div class="icon_info">
              <p class="counter">{{ movieobj.imdbRating.toFixed(1) }}</p>
              <h4>Rating</h4>
            </div>
          </div>
        </div>
        <div class="stats_left">
          <div class="counter_grid">
            <div class="icon_info">
              <p class="counter">{{ movieobj.locationName }}</p>
              <h4>Location</h4>
            </div>
          </div>
        </div>
        <div class="stats_left">
          <div class="counter_grid">
            <div class="icon_info">
              <p class="counter">{{ movieobj.screeningStatus }}</p>
              <h4>Current Status</h4>
            </div>
          </div>
        </div>
        <div class="stats_left">
          <div class="counter_grid">
            <div class="icon_info">
              <p class="counter">{{ movieobj.movieLanguage }}</p>
              <h4>Language</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "movie-detail",
  props: ["movieobj"]
};
</script>

<style scoped>
.w3l-counter-stats-info p {
  font-size: 24px;
  font-weight: 700;
  color: var(--theme-title);
  margin-bottom: 10px;
}
</style>
