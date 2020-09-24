<template>
  <footer class="w3l-footer footer-bottom">
    <section class="footer-inner-main">
      <div class="below-section">
        <div class="container">
          <div class="copyright-footer">
            <div class="columns text-lg-left">
              <p>
                &copy; {{ currentyear }} Movies. All rights reserved | Designed
                by
                <a href="javascript:void(0);">Anik</a>
              </p>
            </div>

            <ul class="social text-lg-right">
              <li>
                <a href="javascript:void(0);"
                  ><span class="fa fa-facebook" aria-hidden="true"></span
                ></a>
              </li>
              <li>
                <a href="javascript:void(0);"
                  ><span class="fa fa-linkedin" aria-hidden="true"></span
                ></a>
              </li>
              <li>
                <a href="javascript:void(0);"
                  ><span class="fa fa-twitter" aria-hidden="true"></span
                ></a>
              </li>
              <li>
                <a href="javascript:void(0);"
                  ><span class="fa fa-google-plus" aria-hidden="true"></span
                ></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  </footer>
</template>

<script>
export default {
  name: "footer-section",
  data() {
    return {
      currentyear: new Date().getFullYear()
    };
  }
};
</script>

<style scoped>
.footer-bottom {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  z-index: 1000;
}
</style>
