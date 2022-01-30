import { useEffect, React } from "react";
import { useSelector, useDispatch } from "react-redux";
import { fetchCategories } from "../Items/ItemsSlice";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { catToIcon } from "./util";
import { setCategory, fetchItemsByCategory } from "../Items/ItemsSlice";
import './Categories.css';

export const Categories = () => {

   
    const dispatch = useDispatch();

    useEffect(()=> {
        
        dispatch(fetchCategories());

    }, [dispatch])

    const categories = useSelector(state => state.items.categories);
    

    const setCategoryHandler = (event) => {
       const id = event.target.id;
        dispatch(setCategory(id));
        dispatch(fetchItemsByCategory(id));
    }

    return (
        <div>
        
            <ul className="categoriesList">
        
                {categories.map(category =>( 
                    
                   <div className="category" >
                        
                        <li id={category.id} onClick={setCategoryHandler}>
                        <FontAwesomeIcon  icon={catToIcon[category.name]} />
                           &nbsp; {category.name}
                        </li>
                    </div>
                   
                    )
                )}
             
            </ul>
        </div>
    )
};
