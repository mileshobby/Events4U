import React from 'react';
import { withRouter } from 'react-router';

class SearchBar extends React.Component{
  constructor(props){
    super(props);
    this.state = {searchString: ""};
    this.search = this.search.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.findResults = this.findResults.bind(this);
    // this.setSearchVal = this.setSearchVal.bind(this);
    this.searchAutocomplete = this.searchAutocomplete.bind(this);
  }


  search(e){
    e.preventDefault();
    const searchString = this.state.searchString;
    if(searchString.length > 0){
      this.props.fetchMatchingEvents(searchString)
      .then( () => {
        this.props.history.push(`/browse-events/Search/${searchString}`);
        this.setState({searchString: ""});
        }
      );
    }
  }

  handleChange(e){
    this.setState({searchString: e.target.value});
    if(e.target.value.length > 0){
      this.props.fetchAutoCompleteResults(e.target.value);
    }
    else{
      this.props.clearAutoCompleteResults();
    }
  }

  findResults(e){
    if(e.target.value.length > 0){
      this.props.fetchAutoCompleteResults(e.target.value);
    }
  }

  // setSearchVal(e){
  //   this.setState({searchString: e.target.textContent});
  //   document.getElementById('search').focus();
  // }

  searchAutocomplete(e){
    e.preventDefault();
    const searchString = e.target.textContent;
    this.props.fetchMatchingEvents(searchString)
    .then( () => {
      this.props.history.push(`/browse-events/Search/${searchString}`);
      this.setState({searchString: ""});
      this.props.clearAutoCompleteResults();
    });
  }


  render(){
    const results = this.props.autoCompleteResults.map((title, i)=>{
      return <li key={`${title}-${i}}`} onMouseDown={this.searchAutocomplete}>{title}</li>;
    });
    return(
      <div id="search-bar-container">
        <form onSubmit={this.search} className="search" autoComplete="off">
          <input
            placeholder="concert, party, festival..."
            type="search"
            value={this.state.searchString}
            onChange={this.handleChange}
            onBlur={this.props.clearAutoCompleteResults}
            onFocus={this.findResults}
            className="searchTerm"
            id="search"
          />
        </form>
        <ul id="autocomplete-results">
          {results}
        </ul>
      </div>
    );
  }
}

export default withRouter(SearchBar);
