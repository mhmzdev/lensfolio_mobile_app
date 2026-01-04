---
to: "lib/blocs/<%= h.changeCase.snake(name) %>/state.dart"
---
<% pascal = h.changeCase.pascal(name) %>
<% rootClass = h.changeCase.pascal(name)+"State" %>
part of 'cubit.dart';
<%= props = "" %>
<%= constructor = "" %>
<%= defConstructor = "" %>
<%= equatable = "" %>
<%= copyWithArgs = "" %>
<%= copyWithBody = "" %>

<% args.forEach(function(arg, index){ %>

<% module = h.changeCase.pascal(arg.module) %>
<% cModule = h.changeCase.camel(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>
<% isLast = index === args.length - 1 %>
<% props += "\tfinal BlocState<"+model+"> "+cModule+";\n" %>
<% constructor += "\t\trequired this."+cModule+",\n" %>
<% defConstructor += "\t\t\t"+cModule+" = BlocState()" + (isLast ? "" : ",") + "\n" %>
<% equatable += "\t\t"+cModule+",\n" %>
<% copyWithArgs += "\t\tBlocState<"+model+">? "+cModule+",\n" %>
<% copyWithBody += "\t\t\t"+cModule+": "+cModule+" ?? this."+cModule+",\n" %>

<% }); %>

@immutable
class <%= rootClass %> extends Equatable {
	// --- nested states --- //
<%- props %>
	// --- state data --- //

	const <%= rootClass %>({
<%- constructor %>	});

	<%= rootClass %>.def()
		: // root-def-constructor
<%- defConstructor %>			;

	<%= rootClass %> copyWith({
<%- copyWithArgs %>	}) {
		return <%= rootClass %>(
<%- copyWithBody %>		);
	}

	@override
	List<Object?> get props => [
		// root-state-props
<%- equatable %>
	];
}
