export const func = {
  searchByMovieId: (nameKey, array) => {
    for (let i = 0; i < array.length; i++) {
      if (array[i].id * 1 === nameKey * 1) {
        return array[i];
      }
    }
  },
  searchByLocationId: (nameKey, array) => {
    let finalArr = [];
    for (let i = 0; i < array.length; i++) {
      if (array[i].locationId * 1 === nameKey * 1) {
        finalArr.push(array[i]);
      }
    }
    return finalArr;
  },
  searchByLanguageId: (nameKey, array) => {
    let finalArr = [];
    for (let i = 0; i < array.length; i++) {
      if (array[i].languageId * 1 === nameKey * 1) {
        finalArr.push(array[i]);
      }
    }
    return finalArr;
  }
};
