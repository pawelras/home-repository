import { React} from "react";
import { useSelector, useDispatch } from "react-redux";
import { setSearchTerm } from "./SearchBarSlice";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSearch } from "@fortawesome/free-solid-svg-icons";
import './SearchBar.css';


export  const SearchBar = () => {

    const dispatch = useDispatch();
    
    const searchTerm = useSelector(state => state.searchBar.searchTerm);
    
    const handleChange = (e) => {
        e.preventDefault()
        dispatch(setSearchTerm(e.target.value))
     };
    
    return (
        <div className="searchContainer">

                <input id="searchBar"
                name="searchTerm"
                value={searchTerm}
                onChange={handleChange}
                type="text"
                placeholder="Type here to search for items"/>
                
                <FontAwesomeIcon  icon={faSearch} />
                        

        </div>
    )
};
