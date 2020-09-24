<template>
  <section class="w3l-grids">
    <div class="grids-main py-4">
      <div class="container py-lg-4">
        <div class="headerhny-title">
          <h3 class="hny-title">Movie Stills</h3>
        </div>
        <div class="owl-two owl-carousel owl-theme">
          <div
            v-for="still in stills"
            :key="still.stillUrl"
            class="item vhny-grid"
          >
            <div class="two-gridshny-grids">
              <div class="two-gridshny-left">
                <div class="box16 mb-4">
                  <a href="#">
                    <figure>
                      <img class="img-fluid" :src="still.stillUrl" alt="" />
                    </figure>
                    <div class="box-content">
                      <h4>&nbsp;</h4>
                    </div>
                  </a>
                </div>
              </div>
              <div class="two-gridshny-right">
                <h3>&nbsp;</h3>
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
  name: "movie-stills",
  props: ["moviestills"],
  data() {
    return {
      stills: []
    };
  },
  created() {
    this.getStills();
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
  },
  methods: {
    getStills() {
      this.stills = [];
      console.log(this.moviestills.movieStills);
      for (let i = 0; i < this.moviestills.movieStills.length; i++) {
        this.stills.push({
          stillUrl: this.moviestills.movieStills[i].movieStillUrl
        });
      }
    }
  }
};
</script>

<style scoped></style>
