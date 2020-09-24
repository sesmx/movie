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
          <p class="mt-4">
            <span
              style="font-style: italic; font-weight: 500; color: #000000; font-size: 16px;"
              >Available on:&nbsp;</span
            >
            <span
              style="font-weight: 500; font-style: italic; color: #000000; font-size: 16px;"
              >{{ soundEffects }}</span
            >
          </p>
          <div class="ready-more mt-4">
            <router-link to="/" :class="'btn read-button'"
              ><span
                class="fa fa-angle-double-left ml-2"
                aria-hidden="true"
              ></span
              >&nbsp;&nbsp;&nbsp;&nbsp;Back</router-link
            >
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
  props: ["movieobj"],
  computed: {
    soundEffects() {
      let effects = "";
      for (let i = 0; i < this.movieobj.soundEffects.length; i++) {
        effects += this.movieobj.soundEffects[i].soundEffect + ", ";
      }
      return effects.trim().replace(/,\s*$/, "");
    }
  }
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
