import React from 'react';
import Menu from './menu';

function Header(props) {
  return (
      <div className="row justify-content-end px-4 pt-2 pb-1 empHeaderContainer">
        <div className="empHeader d-inline flex-fill align-self-center text-capitalize">{ props.text }</div>
        <Menu setView={ props.setView }/>
      </div>
  );
}

export default Header;
