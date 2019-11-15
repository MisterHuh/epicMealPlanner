import React from "react";

class SearchBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSearch(event) {
    event.preventDefault();
    this.props.setView("searchBarResultsList", null, this.state.value);
  }

  render() {
    return (
      <div className="searchBarContainer d-inline-block rounded-circle">
        <form className="d-inline-block" onSubmit={this.handleSearch}>
          <div>
            <input
              className="searchBar d-inline mr-2"
              type="search"
              value={this.state.value}
              placeholder=" Search"
              onChange={this.handleChange}/>

            <img
              className="searchIcon d-inline"
              src="./image/searchIcon.png"
              alt="searchPicture"
              onClick={e=>this.handleSearch(e)}/>
          </div>
        </form>
      </div>
    );
  }
}

export default SearchBar;
