<template>
  <div class="w3l-breadcrumbs">
    <nav id="breadcrumbs" class="breadcrumbs">
      <div class="container page-wrapper">
        <router-link to="/" exact>Home</router-link> &raquo;
        <span class="breadcrumb_last" aria-current="page">{{
          currentRouteName
        }}</span>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "breadcrumb",
  computed: {
    currentRouteName() {
      return this.$route.meta.title;
    }
  }
};
</script>

<style scoped></style>
