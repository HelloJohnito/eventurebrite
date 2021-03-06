import { combineReducers } from 'redux';
import SessionReducer from './session_reducer';
import EventsIndexReducer from './events_index_reducer';
import EventDetailReducer from './event_detail_reducer';
import CategoryReducer from './category_reducer';
import TicketReducer from './ticket_reducer';
import BookmarkReducer from './bookmark_reducer';

const rootReducer = combineReducers({
	session: SessionReducer,
	eventsIndex: EventsIndexReducer,
	eventDetail: EventDetailReducer,
	categories: CategoryReducer,
	tickets: TicketReducer,
	bookmarks: BookmarkReducer
});

export default rootReducer;
