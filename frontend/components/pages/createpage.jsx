import React from 'react';
import EventFormContainer from '../events/event_form_container';


class CreatePage extends React.Component {

  componentDidMount() {
    window.scrollTo(0, 0);
  }

  render(){
    return(
      <div>
        <EventFormContainer formType="new" />
      </div>
    );
  }
}


export default CreatePage;
