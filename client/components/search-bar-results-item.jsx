import React from "react";

function SearchBarResultsItem(props) {
  return (
    <div className="searchBarResultItemContainer card m-auto">
      <div className="row no-gutters flex-grow-1 p-2">
        <div className="col-4">
          <div
            className="card-img-top propsImage"
            style={{
              backgroundImage: "url("+props.image+")",
              backgroundSize: "cover",
              backgroundRepeat:"no-repeat",
              height: "100%",
              width: "100%"
            }}
          ></div>
        </div>
        <div className="col-8">
          <div className="card-body">
            <div
              className="card-title font-weight-bold searchResultItemName"
              onClick={
                e => {
                props.setView("recipeDetails", props.recipe, [])
              }}>
              {props.name}
            </div>
            <p className="card-text">Time: {props.time} minutes</p>
          </div>
        </div>
      </div>
    </div>
  );
}

export default SearchBarResultsItem;
