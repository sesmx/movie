<template>
  <div id="app">
    <header-nav></header-nav>
    <breadcrumb></breadcrumb>
    <router-view />
  </div>
</template>

<style></style>
<script>
import HeaderNav from "@/components/common/header-nav";
import Breadcrumb from "@/components/common/breadcrumb";
export default {
  components: {
    Breadcrumb,
    HeaderNav
  }
};
</script>
