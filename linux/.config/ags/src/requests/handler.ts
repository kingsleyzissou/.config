import ScreenCaptureService from '@services/screencapture';

export const requestHandler = async (
  request: string,
  res: (response: any) => void,
) => {
  const capture = ScreenCaptureService.get_default();

  if (request == 'colour') {
    await capture.pickColor();
    return res('Colour picked successfully');
  }

  if (request == 'output') {
    await capture.screenshot(request);
    return res('Display captured');
  }

  if (request == 'active') {
    await capture.screenshot(request);
    return res('Active window captured');
  }

  if (request == 'record') {
    await capture.record();
    return res('Screen recording started...');
  }

  res('unknown command');
};
