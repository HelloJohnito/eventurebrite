import { connect } from 'react-redux';
import EventDetail from './event_detail';
import { fetchDetailEvent } from "../../actions/event_actions";
import { createTicket } from "../../actions/ticket_actions";
import { clearErrors } from "../../actions/session_actions";

const mapStateToProps = (state, ownProps) => ({
  event: state.eventDetail,
  currentUser: state.session.currentUser,
  eventId: ownProps.eventId
});

const mapDispatchToProps = dispatch => ({
  fetchDetailEvent: (id) => dispatch(fetchDetailEvent(id)),
  createTicket: (eventId) => dispatch(createTicket(eventId)),
  clearErrors: () => dispatch(clearErrors())
});

export default connect(mapStateToProps, mapDispatchToProps)(EventDetail);
