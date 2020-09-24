<template>
  <div id="app">
    <header-nav></header-nav>
    <breadcrumb></breadcrumb>
    <router-view />
    <footer-section></footer-section>
  </div>
</template>

<style></style>
<script>
import HeaderNav from "@/components/common/header-nav";
import Breadcrumb from "@/components/common/breadcrumb";
import FooterSection from "@/components/common/footer-section";
export default {
  components: {
    FooterSection,
    Breadcrumb,
    HeaderNav
  }
};
</script>
