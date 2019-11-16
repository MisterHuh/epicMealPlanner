import React from "react";
import SearchBar from "./search-bar";
import Calendar from "./calendar";
import Header from './header';

class RecipeDetails extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      modal: ''
    };
    this.handleShoppingList = this.handleShoppingList.bind(this);
    this.showModal = this.showModal.bind(this);
  }

  closeModal() {
    this.setState({
      modal: ''
    });
  }

  showModal(recipe) {

    let favAdded = "Added to";
    let favRemoved = "Removed from";
    let favMessage = this.props.recipe.categories === "favorites" ? favAdded : favRemoved;

    if(this.state.modal === ''){
      return null;
    } else if (this.state.modal === 'shoppinglist') {
      return (
        <div onClick={() => { this.closeModal(); }}>
          <div className="modalToo modalText textFont">Added to Shopping List</div>
        </div>
      );
    } else if (this.state.modal === 'favorites') {
      return (
        <div onClick={() => { this.closeModal(); }}>
          <div className="modalToo modalText textFont">{favMessage} <br/> Favorites</div>
        </div>
      );
    } else if (this.state.modal === 'calendar') {
      return (
        <div>
          <div className="modal rdCalendarModalSizing">
            <div className= "float-right mr-3"
              onClick={() => {
                this.closeModal();
              }}><i className="fas fa-times"></i>
            </div>
            <div className="smallCalendar">
              <Calendar recipeId={recipe} setView={this.props.setView} view={this.props.view}/>
            </div>
          </div>
        </div>
      );
    }
  }

  handleCalendar() {
    this.setState({
      modal: 'calendar'
    });
    this.showModal();
  }

  handleFavorites() {
    let recipeCategoryToggled;
    this.setState({ modal: 'favorites' });
    this.showModal();
    this.putRecipeInFavorites(this.props.recipe);

    if (this.props.recipe.categories !== "favorites") {
      recipeCategoryToggled = {
        categories: "favorites",
        cooking_time: this.props.recipe.cooking_time,
        directions_url: this.props.recipe.directions_url,
        id: this.props.recipe.id,
        image_url: this.props.recipe.image_url,
        ingredients: this.props.recipe.ingredients,
        label: this.props.recipe.label,
        recipe_id: this.props.recipe.recipe_id,
        serving_size: this.props.recipe.serving_size
        }
    } else {
        recipeCategoryToggled = {
          categories: null,
          cooking_time: this.props.recipe.cooking_time,
          directions_url: this.props.recipe.directions_url,
          id: this.props.recipe.id,
          image_url: this.props.recipe.image_url,
          ingredients: this.props.recipe.ingredients,
          label: this.props.recipe.label,
          recipe_id: this.props.recipe.recipe_id,
          serving_size: this.props.recipe.serving_size
      }
    };
    this.props.setView("recipeDetails", recipeCategoryToggled)
  }

  handleShoppingList() {
    let recipe = this.props.recipe.ingredients.split('\n');
    fetch(`/api/addtoShoppingListFromDetails.php`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(recipe),
    })
    this.setState({
      modal: 'shoppinglist'
    });
    this.showModal();
  }

  putRecipeInFavorites(data){
    fetch('/api/addToFavorites.php',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })
  }

  render() {
    let recipe = this.props.recipe;
    let props = this.props
    let ingredientLines = recipe.ingredients.split('\n');

    let red = "./image/redHeart.png";
    let white = "./image/whiteHeartIcon.png";
    let jaeTestHeart = recipe.categories === "favorites" ? red : white;

    return (
      <div>
        <Header setView={this.props.setView} text="Epic Meal Planner"/>

        <div className="row justify-content-center my-5">
          <SearchBar setView={this.props.setView}/>
        </div>

        <div className="card rdCard">

          <div className='rdLabel mb-4 text-center'>{recipe.label}</div>

          <div className="row rdWrapper mb-3">

            <div className="rdImgContainer">
              <div className="rdImg" style={{backgroundImage: "url("+recipe.image_url+")"}}></div>
            </div>

            <div className="rdSideInfoWrapper">

              <div className="rdSideInfoContainer">
                <div className="">Time: {recipe.cooking_time} minutes</div>
              </div>

              <div className="rdSideInfoContainer">
               <div className="">Serving size: {recipe.serving_size}</div>
            </div>

            <div className="rdSideInfoContainer rdButtonWrapper">
              <div className="rdButtonContainer">
                <img
                  className="calendarIcon imgIcon"
                  src="./image/calendarIcon.png"
                  alt="First Icon"
                  onClick={()=>this.handleCalendar()}/>
              </div>

              <div className="rdButtonContainer m-auto">
                <img
                  className="heartIcon imgIcon"
                  src={jaeTestHeart}
                  alt="Second Icon"
                  onClick={()=>this.handleFavorites()}/>
              </div>

              <div className="rdButtonContainer">
              <img
                className="shoppingListIcon imgIcon"
                onClick= {() => this.handleShoppingList()}
                src="./image/shoppingList.png"
                alt="Third Icon"/>
              </div>
            </div>    { /* rdButtoNWrapper ends */}

            </div>      { /* rdSideInfo ends */}
          </div>        { /* rdWrapper ends */}

          <div className="rdIngredientsContainer">
            <div className="rdIngredientsHeader my-2">INGREDIENTS</div>
            <div classname="rdIndivIngredients">
              {ingredientLines.map((ingredient, i) => {
                  return <div className="py-1" key={i}>- {ingredient}</div>;
                })}
            </div>

            <div className="mt-3 text-center mt-3">
              <a className="rdInstructions text-secondary font-weight-bold" href={recipe.directions_url} target="_blank">Click for Instructions</a>
            </div>
            {this.showModal(recipe)}
          </div>

        </div>    { /* card ends */}

      </div>
    );
  }
}

export default RecipeDetails;
