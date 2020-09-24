<template>
  <section class="w3l-albums py-5" id="projects">
    <div class="container py-lg-4">
      <div class="row">
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
                        <span class="post"
                          ><span class="fa fa-clock-o"> </span> 2 Hr 4min
                        </span>
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
      ]
    };
  },
  created() {
    const _vm = this;
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
        _vm.nowShowingMovies = _nowShowingMovies;
        _vm.upcomingMovies = _upcomingMovies;
      });
    }
  }
};
</script>
