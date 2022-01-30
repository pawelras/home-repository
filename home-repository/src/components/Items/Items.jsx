import React from "react";
import { ItemTile } from "../ItemTile/ItemTile";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchItems } from "./ItemsSlice";
import { Categories } from "../Categories/Categories";
import './Items.css';



export const Items = () => {

    const items = useSelector(state => state.items.items);
    const searchTerm = useSelector(state => state.searchBar.searchTerm);
    
  
    const filteredItems = searchTerm ? items?.filter(item => item.name.toLowerCase().includes(searchTerm.toLowerCase())) : items;

    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchItems())
        
    }, [dispatch])

    if (!filteredItems) { return (<p>Loading Results</p>)}
   
    return(
        
        <div>
        <Categories />

            <div className="itemsTiles" >
                {filteredItems.map(item => 
                    <ItemTile item={item}/>
                )}
                            
            </div>
        </div>
    )
};
