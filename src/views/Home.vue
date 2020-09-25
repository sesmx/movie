<template>
  <section class="w3l-albums py-5" id="projects">
    <div class="container py-lg-4">
      <fieldset class="border p-2">
        <legend class="w-auto">Filter by</legend>
        <div class="row" style="padding: 0 0 25px 0;">
          <div class="col-lg-3 mt-lg-0 mt-0">
            <label style="font-weight: bold;">Language</label>
            <select
              class="form-control"
              @change.prevent="filterByLanguage($event)"
            >
              <option value="0">ALL</option>
              <option
                v-for="lang in languages"
                :key="lang.id"
                :value="lang.id"
                >{{ lang.movieLanguage }}</option
              >
            </select>
          </div>
          <div class="col-lg-4 mt-lg-0 mt-0">
            <label style="font-weight: bold;">Location</label>
            <select
              class="form-control"
              @change.prevent="filterByLocation($event)"
            >
              <option value="0">ALL</option>
              <option v-for="loc in locations" :key="loc.id" :value="loc.id">{{
                loc.locationName
              }}</option>
            </select>
          </div>
        </div>
      </fieldset>
      <div class="row" style="padding: 30px 0 0 0;">
        <div class="col-lg-12 mx-auto">
          <div id="parentHorizontalTab">
            <ul class="resp-tabs-list hor_1">
              <li>Now Showing</li>
              <li>Upcoming Movies</li>
              <div class="clear"></div>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div class="albums-content">
                <div class="row">
                  <div
                    v-for="movie in nowShowingMovies"
                    :key="movie.id"
                    class="col-lg-4 new-relise-gd mt-lg-0 mt-0"
                  >
                    <div class="slider-info">
                      <div class="img-circle">
                        <router-link :to="'/moviedetail/' + movie.id" exact>
                          <img
                            :src="movie.posterUrl"
                            class="img-fluid"
                            :alt="movie.movieTitle"
                          />
                          <div class="overlay-icon">
                            <span
                              class="fa fa-play video-icon"
                              aria-hidden="true"
                            ></span>
                          </div>
                        </router-link>
                      </div>
                      <div class="message">
                        <p>{{ movie.movieLanguage }}</p>
                        <router-link
                          :class="'author-book-title'"
                          :to="'/moviedetail/' + movie.id"
                          exact
                          >{{ movie.movieTitle }}</router-link
                        >
                        <h4>
                          <span class="post">{{ movie.locationName }} </span>
                          <span class="post fa fa-heart text-right"></span>
                        </h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="albums-content">
                <div
                  v-for="movie in upcomingMovies"
                  :key="movie.id"
                  class="col-lg-4 new-relise-gd mt-lg-0 mt-0"
                >
                  <div class="slider-info">
                    <div class="img-circle">
                      <router-link :to="'/moviedetail/' + movie.id" exact>
                        <img
                          :src="movie.posterUrl"
                          class="img-fluid"
                          :alt="movie.movieTitle"
                        />
                        <div class="overlay-icon">
                          <span
                            class="fa fa-play video-icon"
                            aria-hidden="true"
                          ></span>
                        </div>
                      </router-link>
                    </div>
                    <div class="message">
                      <p>{{ movie.movieLanguage }}</p>
                      <router-link
                        :class="'author-book-title'"
                        :to="'/moviedetail/' + movie.id"
                        exact
                        >{{ movie.movieTitle }}</router-link
                      >
                      <h4>
                        <span class="post">{{ movie.locationName }} </span>
                        <span class="post fa fa-heart text-right"></span>
                      </h4>
                    </div>
                  </div>
                </div>
              </div>
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
      nowShowingMovies: [
        {
          id: 0,
          imdbId: "",
          imdbRating: 0.0,
          languageId: 0,
          locationId: 0,
          locationName: "",
          movieLanguage: "",
          movieStills: [
            {
              id: 0,
              movieId: 0,
              movieStillUrl: ""
            }
          ],
          movieTitle: "",
          plot: "",
          posterUrl: "",
          screeningStatus: "",
          screeningStatusId: 0,
          soundEffects: [
            {
              id: 0,
              movieId: 0,
              soundEffect: "",
              soundEffectId: 0
            }
          ]
        }
      ],
      upcomingMovies: [
        {
          id: 0,
          imdbId: "",
          imdbRating: 0.0,
          languageId: 0,
          locationId: 0,
          locationName: "",
          movieLanguage: "",
          movieStills: [
            {
              id: 0,
              movieId: 0,
              movieStillUrl: ""
            }
          ],
          movieTitle: "",
          plot: "",
          posterUrl: "",
          screeningStatus: "",
          screeningStatusId: 0,
          soundEffects: [
            {
              id: 0,
              movieId: 0,
              soundEffect: "",
              soundEffectId: 0
            }
          ]
        }
      ],
      movies: [
        {
          id: 0,
          imdbId: "",
          imdbRating: 0.0,
          languageId: 0,
          locationId: 0,
          locationName: "",
          movieLanguage: "",
          movieStills: [
            {
              id: 0,
              movieId: 0,
              movieStillUrl: ""
            }
          ],
          movieTitle: "",
          plot: "",
          posterUrl: "",
          screeningStatus: "",
          screeningStatusId: 0,
          soundEffects: [
            {
              id: 0,
              movieId: 0,
              soundEffect: "",
              soundEffectId: 0
            }
          ]
        }
      ],
      languages: [
        {
          id: 0,
          movieLanguage: ""
        }
      ],
      locations: [
        {
          id: 0,
          locationName: ""
        }
      ]
    };
  },
  created() {
    const _vm = this;
    _vm.getLanguages();
    _vm.getLocations();
    _vm.getAllMovies();
  },
  mounted() {
    const _vm = this;
    _vm.$nextTick(function() {
      // eslint-disable-next-line no-undef
      $("#parentHorizontalTab").easyResponsiveTabs({
        type: "default",
        width: "auto",
        fit: true,
        tabidentify: "hor_1",
        // eslint-disable-next-line no-unused-vars
        activate: function(event) {
          // eslint-disable-next-line no-undef
          let $tab = $(this);
          // eslint-disable-next-line no-undef
          let $info = $("#nested-tabInfo");
          // eslint-disable-next-line no-undef
          let $name = $("span", $info);
          $name.text($tab.text());
          $info.show();
        }
      });
    });
  },
  methods: {
    getAllMovies() {
      const _vm = this;
      let url = _vm.$store.state.apiRoot + "/api/Movie/GetAll";
      _vm.$axios.get(url).then(function(resp) {
        _vm.movies = resp.data;
        _vm.$store.state.movies = resp.data;
        /*for (let i = 0; i < _vm.movies.length; i++) {
          _vm.$store.commit("addMovie", _vm.movies[i]);
        }*/
        let _nowShowingMovies = [];
        let _upcomingMovies = [];
        for (let i = 0; i < resp.data.length; i++) {
          if (resp.data[i].screeningStatusId === 2) {
            _nowShowingMovies.push(resp.data[i]);
          } else {
            _upcomingMovies.push(resp.data[i]);
          }
        }
        _vm.$store.state.nowshowing = _vm.nowShowingMovies = _nowShowingMovies;
        _vm.$store.state.upcoming = _vm.upcomingMovies = _upcomingMovies;
      });
    },
    getLanguages() {
      const _vm = this;
      let url = _vm.$store.state.apiRoot + "/api/Movie/Languages";
      _vm.$axios.get(url).then(function(resp) {
        _vm.languages = resp.data;
      });
    },
    getLocations() {
      const _vm = this;
      let url = _vm.$store.state.apiRoot + "/api/Movie/Locations";
      _vm.$axios.get(url).then(function(resp) {
        _vm.locations = resp.data;
      });
    },
    filterByLanguage(event) {
      const _vm = this;
      if (event.target.value * 1 !== 0) {
        _vm.nowShowingMovies = _vm.$func.searchByLanguageId(
          event.target.value,
          _vm.$store.state.nowshowing
        );
        _vm.upcomingMovies = _vm.$func.searchByLanguageId(
          event.target.value,
          _vm.$store.state.upcoming
        );
      } else {
        _vm.nowShowingMovies = _vm.$store.state.nowshowing;
        _vm.upcomingMovies = _vm.$store.state.upcoming;
      }
    },
    filterByLocation(event) {
      const _vm = this;
      if (event.target.value * 1 !== 0) {
        _vm.nowShowingMovies = _vm.$func.searchByLocationId(
          event.target.value,
          _vm.$store.state.nowshowing
        );
        _vm.upcomingMovies = _vm.$func.searchByLocationId(
          event.target.value,
          _vm.$store.state.upcoming
        );
      } else {
        _vm.nowShowingMovies = _vm.$store.state.nowshowing;
        _vm.upcomingMovies = _vm.$store.state.upcoming;
      }
    }
  }
};
</script>
