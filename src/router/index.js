import Vue from "vue";
import VueRouter from "vue-router";
/*import store from "@/store/index";*/

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: () => import("../views/Home.vue"),
    meta: {
      requiresAuth: false,
      title: "Home"
    }
  },
  {
    path: "/moviedetail/:id",
    name: "Movie Details",
    component: () => import("../views/MovieDetails.vue"),
    meta: {
      requiresAuth: false,
      title: "Movie Details"
    }
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  scrollBehavior() {
    return {
      x: 0,
      y: 0
    };
  },
  routes,
  linkActiveClass: "active",
  linkExactActiveClass: "exact-active"
});

/*router.beforeEach(async (to, from, next) => {
  console.log(store);
  next();
});*/

export default router;
