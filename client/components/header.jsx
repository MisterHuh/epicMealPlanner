import React from 'react';
import Menu from './menu';

function Header(props) {
  return (
    // <div className="container">
      <div className="row justify-content-end px-4 pt-2 pb-1 empHeader">
        <div className="d-inline flex-fill align-self-center text-capitalize">{ props.text }</div>
        <Menu setView={ props.setView }/>
      </div>
    // </div>
  );
}

export default Header;
