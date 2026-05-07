import { Gtk } from 'astal/gtk3';

type MenuProps = {
  name: string;
  icon: string;
  title: string;
  children: Gtk.Widget[];
};

export const Menu = ({ name, icon, title, children }: MenuProps) => {
  return (
    <revealer reveal_child>
      <box className={`menu ${name}`} vertical>
        <box className="title-box">
          <icon className="icon" icon={icon} />
          <label className="title" label={title} />
        </box>
        <box vertical>{children}</box>
      </box>
    </revealer>
  );
};
