import React from "react";

class Menu extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showMenu: true
    };
    this.setMenu = this.setMenu.bind(this);
  }

  setMenu() {
    this.setState({ showMenu: !this.state.showMenu })
  };

  render() {
    const containerOpacity = {
      backgroundColor: "rgb(0, 0, 0, 0.4)",
    };

    if (!this.state.showMenu) {
      return <i className="fas fa-bars headerTextMenu headerMenuSize mx-2 align-self-center" onClick={this.setMenu}></i>
    } else {
      return (
        // <div className="wrapper headerMenuSize">
          <div className="menuWrapper d-flex column modal py-0 px-0 d-inline-block" style={containerOpacity}>

            <div className="menuGreyHalf border border-dark modal-body py-0 px-0" onClick={this.setMenu}></div>

            <div className="menuContainer border border-dark modal-body py-0 px-0">
              <div className="pl-4 py-4 font-weight-bold" onClick={
                () => { this.props.setView("home", {});
                this.setMenu();}}>Home</div>
              <div className="pl-4 py-4 font-weight-bold" onClick={
                () => { this.props.setView("recipes", {});
                this.setMenu();}}>Recipes</div>
              <div className="pl-4 py-4 font-weight-bold" onClick={
                () => { this.props.setView("calendar", {});
                this.setMenu();}}>Calendar</div>
              <div className="pl-4 py-4 font-weight-bold" onClick={
                () => { this.props.setView("shoppingList", {});
                this.setMenu();}}>Shopping List</div>
            </div>
          </div>
        // </div>
      )
    }
  }


}

export default Menu;
