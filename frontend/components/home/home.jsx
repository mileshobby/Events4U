import React from 'react';

class Home extends React.Component{

  constructor(props){
    super(props);
  }

  render(){
    return(
      <div id="home">
        <img
          src="http://res.cloudinary.com/events4u/image/upload/v1495089580/color_splash_copy_qli1my.jpg"
          id="main-home-img">
          
        </img>
      </div>
    );
  }

}

export default Home;
