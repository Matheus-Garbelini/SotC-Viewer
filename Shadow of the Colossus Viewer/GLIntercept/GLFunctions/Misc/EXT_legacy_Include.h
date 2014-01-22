#define GLI_LEGACY_INCLUDE_EXT

//Seleted legacy extensions

void glMultiDrawArraysEXT( GLenum[Primitives] mode, GLint *first, GLsizei *count, GLsizei primcount);
void glMultiDrawElementsEXT (GLenum[Primitives] mode, GLsizei *count, GLenum[Main] type, const GLvoid **indices, GLsizei primcount);

void glPointParameterfEXT ( GLenum[Main] pname, GLfloat param );
void glPointParameterfvEXT ( GLenum[Main] pname, GLfloat *params );

//Texture extensions
//Custom type being used to flag a image index (really an GLuint)
void glBindTextureEXT( GLenum[Main] target, GLimageindex texture );
void glGenTexturesEXT( GLsizei n, GLuint *textures );
void glDeleteTexturesEXT( GLsizei n, const GLuint *textures);

void glPrioritizeTexturesEXT( GLsizei n, const GLuint *textures, const GLclampf *priorities );
GLboolean glAreTexturesResidentEXT( GLsizei n, const GLuint *textures, GLboolean *residences );
GLboolean glIsTextureEXT( GLuint texture );

void glTexSubImage1DEXT( GLenum[Main] target, GLint level, GLint xoffset, GLsizei width, GLenum[Main] format, GLenum[Main] type, const GLvoid *pixels );
void glTexSubImage2DEXT( GLenum[Main] target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum[Main] format, GLenum[Main] type, const GLvoid *pixels );

void glCopyTexImage1DEXT( GLenum[Main] target, GLint level, GLenum[Main] internalformat, GLint x, GLint y, GLsizei width, GLint border );
void glCopyTexImage2DEXT( GLenum[Main] target, GLint level, GLenum[Main] internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border );

void glCopyTexSubImage1DEXT( GLenum[Main] target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width );
void glCopyTexSubImage2DEXT( GLenum[Main] target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height );

//Vertex arrays
void glArrayElementEXT( GLint i );
void glVertexPointerEXT( GLint size, GLenum[Main] type, GLsizei stride, const GLvoid *ptr );
void glNormalPointerEXT( GLenum[Main] type, GLsizei stride, const GLvoid *ptr );
void glColorPointerEXT( GLint size, GLenum[Main] type, GLsizei stride, const GLvoid *ptr );
void glIndexPointerEXT( GLenum[Main] type, GLsizei stride, const GLvoid *ptr );
void glTexCoordPointerEXT( GLint size, GLenum[Main] type, GLsizei stride, const GLvoid *ptr );
void glEdgeFlagPointerEXT( GLsizei stride, const GLvoid *ptr );
void glGetPointervEXT( GLenum[Main] pname, void **params );
void glDrawArraysEXT( GLenum[Primitives] mode, GLint first, GLsizei count );

void glAddSwapHintRectWIN(GLint x, GLint y, GLsizei width, GLsizei height);

void glColorTableEXT( GLenum[Main] target, GLenum[Main] internalformat, GLsizei width, GLenum[Main] format, GLenum[Main] type, const GLvoid *table );
void glColorSubTableEXT( GLenum[Main] target, GLsizei start, GLsizei count, GLenum[Main] format, GLenum[Main] type, const GLvoid *data );

void glGetColorTableEXT( GLenum[Main] target, GLenum[Main] format, GLenum[Main] type, GLvoid *table );
void glGetColorTableParameterfvEXT( GLenum[Main] target, GLenum[Main] pname, GLfloat *params );
void glGetColorTableParameterivEXT( GLenum[Main] target, GLenum[Main] pname, GLint *params );
