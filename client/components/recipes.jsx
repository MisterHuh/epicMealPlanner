import React from "react";
import Header from "./header";

function Recipes(props) {
  return (
    <div>
      <Header setView={props.setView} text="Recipes" />
      <div className="recipesResponsiveness container mt-5 d-flex flex-wrap">
          <div
            className="favorites card text-center recipeContainer my-3"
            onClick={() => {
              props.setView("recipesCategoriesList", {}, "");
              props.setCategory("favorites");
            }}
          >
            Favorites
          </div>
          <div
            className="vegan card text-center recipeContainer my-3"
            onClick={() => {
              props.setView("recipesCategoriesList", {}, "");
              props.setCategory("vegan");
            }}
          >
            Vegan
          </div>
          <div
            className="keto card text-center recipeContainer my-3"
            onClick={() => {
              props.setView("recipesCategoriesList", {}, "");
              props.setCategory("keto");
            }}
          >
            Keto
          </div>
          <div
            className="paleo card text-center recipeContainer my-3"
            onClick={() => {
              props.setView("recipesCategoriesList", {}, "");
              props.setCategory("paleo");
            }}
          >
            Paleo
          </div>
          <div
            className="dairyFree card text-center recipeContainer my-3"
            onClick={() => {
              props.setView("recipesCategoriesList", {}, "");
              props.setCategory("dairy-free");
            }}
          >
            Dairy-Free
          </div>
          <div
            className="glutenFree card text-center recipeContainer my-3"
            onClick={() => {
              props.setView("recipesCategoriesList", {}, "");
              props.setCategory("gluten-free");
            }}
          >
            Gluten-Free
          </div>
        </div>
      </div>
  );
}

export default Recipes;
