var existing = new GlideRecord('x_1623260_course_0_subscription'); // Use actual table name
existing.addQuery('user', current.user);
existing.addQuery('course', current.course);
existing.query();

if (existing.next()) {
    gs.addErrorMessage('This user is already subscribed to this course.');
    current.setAbortAction(true);
}