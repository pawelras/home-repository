import {React, useEffect } from "react";
import { SearchBar } from "../SearchBar/SearchBar";
import { Link, useLocation } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { fetchUser } from "../Dashboard/DashboardSlice";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faShoppingCart, faUserCircle, faSignInAlt } from "@fortawesome/free-solid-svg-icons";
import { fetchCartItems } from "../Cart/CartSlice";
import './Header.css';


export const Header = () => {
       
    const location = useLocation();
    const showSearch = location.pathname === "/" ? true : false;

    const dispatch = useDispatch();

    useEffect(()=> {
        dispatch(fetchUser());
  
    }, [dispatch]);

    useEffect(()=> {
        dispatch(fetchCartItems());
  
    }, [dispatch])

    
    const user = useSelector(state => state.dashboard.user);
    const isUser = Object.keys(user).length!==0;
    
    const noItems = useSelector(state => state.cart.noItems);
    
  
    return(
        <div className="header">
            <a href="https://homerepository.herokuapp.com/"><div className="logo"><img  src={`images/logo1.png`}/></div></a>
            {showSearch &&  <SearchBar />}
            <div className="account">
                {!isUser && <a className="link" href="/users/login"><FontAwesomeIcon  icon={faSignInAlt} />&nbsp;Login</a>}
                {isUser && <Link className="link account" to="/dashboard"><FontAwesomeIcon  icon={faUserCircle} />&nbsp; Account</Link>}
                {isUser && <Link className="link account" to="/cart">  <FontAwesomeIcon  icon={faShoppingCart} /> &nbsp; Cart &nbsp; ({noItems}) </Link>}
            </div>
         </div>
    )
};
