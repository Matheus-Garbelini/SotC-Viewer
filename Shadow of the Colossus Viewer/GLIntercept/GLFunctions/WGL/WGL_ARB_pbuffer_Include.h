#define GLI_INCLUDE_WGL_ARB_PBUFFER


void * wglCreatePbufferARB(void * hDC, GLint iPixelFormat, GLint iWidth, GLint iHeight, const GLint *piAttribList);

void * wglGetPbufferDCARB(void * hPbuffer);

GLint wglReleasePbufferDCARB(void * hPbuffer,void * hDC);

GLboolean wglDestroyPbufferARB(void * hPbuffer);

GLboolean wglQueryPbufferARB(void *hPbuffer, GLint iAttribute, GLint *piValue);


//EXT version
void * wglCreatePbufferEXT(void * hDC, GLint iPixelFormat, GLint iWidth, GLint iHeight, const GLint *piAttribList);

void * wglGetPbufferDCEXT(void * hPbuffer);

GLint wglReleasePbufferDCEXT(void * hPbuffer, void * hDC);

GLboolean wglDestroyPbufferEXT(void * hPbuffer);

GLboolean wglQueryPbufferEXT(void * hPbuffer, GLint iAttribute, GLint *piValue);
