import React from 'react';
import axios from 'axios';

export default class Trip extends React.Component {


    render = () => {
        return(
            <div>
                <h3>
                    There are {this.state.trips} books in the catalog.
                </h3>
            </div>
        );
    };
}   