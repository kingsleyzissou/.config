import GObject, { register } from 'astal/gobject';
import { execAsync } from 'astal/process';

const EXPIRY = '2000';

type SendArgs = {
  app: string;
  image?: string;
  message: string;
  expiry?: string;
  actions?: any[];
};

@register({ GTypeName: 'Notifier' })
export default class Notifier extends GObject.Object {
  static instance: Notifier;
  static get_default() {
    if (!this.instance) this.instance = new Notifier();

    return this.instance;
  }

  public async send({ app, image, message, expiry, actions }: SendArgs) {
    const imageArgs = image ? ['-h', `string:image-path:${image}`] : [];
    const actionArgs =
      actions && actions.length > 0
        ? actions.map(
            ({ action, path, message }) =>
              `--action=action:${action} ${path}=${message}`,
          )
        : [];
    await execAsync([
      'notify-send',
      '-t',
      expiry ?? EXPIRY,
      '-a',
      app,
      ...imageArgs,
      ...actionArgs,
      message,
    ]);
  }

  constructor() {
    super();
    this.send = this.send.bind(this);
  }
}
