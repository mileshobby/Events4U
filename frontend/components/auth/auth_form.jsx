import React from 'react';
import { withRouter } from 'react-router';
import { Link } from 'react-router-dom';

class AuthForm extends React.Component{
  constructor(props){
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateState = this.updateState.bind(this);
    this.renderErrors = this.renderErrors.bind(this);
    this.proessForm = this.processForm.bind(this);
    this.toggleType = this.toggleType.bind(this);
    this.signInAsGuest = this.signInAsGuest.bind(this);
    this.state = { username: "", password: "", type: this.props.formType};
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = {username: this.state.username, password: this.state.password};
    this.processForm(user);
    this.props.clearErrors();
  }

  processForm(user){
    if(this.state.type === "Log In"){
      this.props.login(user);
    }
    else{
      this.props.signup(user);
    }
  }

  updateState(key){
    return (e) => {
      this.setState({[key]: e.target.value});
    };
  }

  navLink(){
    if(this.state.type === "Log In"){
      return "Don't have an account? Sign up instead!" ;
    }
    else{
      return "Already have an account? Sign in instead!";
    }
  }

  toggleType(){
    this.state.username = "";
    this.state.password = "";
    this.props.clearErrors();
    if(this.state.type === "Log In"){
      this.setState({type: "Sign Up"}) ;
    }
    else{
      this.setState({type: "Log In"});
    }
  }

  signInAsGuest(){
    this.props.login({username: "GuestUser", password: "password"})
      .then(window.scrollTo(0,0));
  }

  renderErrors() {
    return(
      <ul className="errors-list">
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}-{error}`} className="errors">
            {error}
          </li>
        ))}
      </ul>
    );
  }

  render(){
    return (
      <div className="auth-form-container">
        <form className="auth-form">

          <div className="centered-text">
            <h2>{this.state.type}</h2>
          </div>

          {this.renderErrors()}

          <input
            type="text"
            value={this.state.username}
            onChange={this.updateState("username")}
            placeholder="Username">
          </input>

        <br></br>

          <input
            type="password"
            value={this.state.password}
            onChange={this.updateState("password")}
            placeholder="Password">
          </input>

        <br></br>

        <input
          type="submit"
          onClick={this.handleSubmit}
          value={this.state.type}>
        </input>

        <h3 onClick={this.toggleType}>{this.navLink()}</h3>

        <h3 onClick={this.signInAsGuest}>
          Continue As Guest
        </h3>

        </form>

      </div>
    );
  }
}

export default withRouter(AuthForm);
