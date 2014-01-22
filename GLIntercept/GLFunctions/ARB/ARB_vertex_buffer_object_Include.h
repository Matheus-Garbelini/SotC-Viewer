#define GLI_INCLUDE_ARB_VERTEX_BUFFER_OBJECT


void glBindBufferARB (GLenum[Main] target, GLuint buffer);

void glDeleteBuffersARB (GLsizei n, const GLuint *buffers);

void glGenBuffersARB (GLsizei n, GLuint *buffers);

GLboolean glIsBufferARB (GLuint buffer);

//TODO: These three functions really use the new types GLsizeiptr and GLintptr - May need to update
void glBufferDataARB (GLenum[Main] target, GLsizei size, const GLvoid *data, GLenum[Main] usage);
void glBufferSubDataARB (GLenum[Main] target, GLint offset, GLsizei size, const GLvoid *data);
void glGetBufferSubDataARB (GLenum[Main] target, GLint offset, GLsizei size, GLvoid *data);

GLvoid* glMapBufferARB (GLenum[Main] target, GLenum[Main] access);

GLboolean glUnmapBufferARB (GLenum[Main] target);

void glGetBufferParameterivARB (GLenum[Main] target, GLenum[Main] pname, GLint *params);

void glGetBufferPointervARB (GLenum[Main] target, GLenum[Main] pname, GLvoid **params);
