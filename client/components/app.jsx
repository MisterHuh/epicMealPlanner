import React from "react";
import Calendar from "./calendar";
import ShoppingList from './shopping-list';
import SearchBar from "./searchBar";
import SearchResults from "./searchResults";
import RecipeDetails from "./recipeDetails";
import Menu from "./menu";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: {
        name: "home",
        recipe: {}
      },
      results: [],
      modal: "none"
    };
    this.setView = this.setView.bind(this);
    this.setModal = this.setModal.bind(this);
    this.getFavorites = this.getFavorites.bind(this);
  }

  componentDidMount() {
    this.getFavorites()
  }

  setView(name, recipe, results) {
    this.setState({
      view: { name: name, recipe: recipe },
      results: results
    });
  }

  getFavorites(){
    fetch(`/api/getFavorites.php`)
      .then(res => res.json())
      .then(response => {
        console.log(response);
        this.setState({ modal: response }); // to be deleted
      });

  }

  setModal(modal) {
    this.setState({ modal });
  }
  render() {
    let display;
    let menu = <Menu setView={this.setView}/>
    if (this.state.view.name === "home") {
      display = <SearchBar setView={this.setView} />;
    } else if (this.state.view.name === "search bar result") {
      display = (
        <SearchResults setView={this.setView} results={this.state.results} />
      );
    } else if (this.state.view.name==="recipe details"){
      display=(<RecipeDetails setView={this.setView} recipe={this.state.view.recipe}/>)
    } else if(this.state.view.name==="calendar"){
      display=(<Calendar setView={this.setView} setModal={this.setModal}/>)
    }else if(this.state.view.name==="shoppinglist"){
      display=(<ShoppingList setView={this.setView} setModal={this.setModal}/>)
    }
    return (
      <div>
        {display}
        {menu}
      </div>
    );
  }

}

export default App;
