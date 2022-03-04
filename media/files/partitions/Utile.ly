\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Utile"
composer = #"Julien Clerc"
meter = #"(Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"
kwfrench = #"Oui"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
    % à remplacer par \autoLineBreaksOff et \autoBreaksOff
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  g2.*4:m9 g2.*2:m9 f2.*3:6 es2:6 es4:7+
  es2:6 es4:7+ a2.:m5-7 d2:7sus4 d4:7 g2:m3.5.9 g4:m
  g2.:m7/f g:m7/es d2:7sus4 d4:7 g2.:m
  g:m6- fis2:dim7 d4/fis fis2:dim7 d4/fis g2.:m6- g:m7 c:m7 f4:7 g:m7 a:m5-7
  bes2. es2 es4:7+ a2.:m5-7 d4:7 a:m7/e d:7/fis g2.*2:m9 g:m9
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 3/4
  \autoPageBreaksOff \oneVoice
  \mark \markup \box \bold Intro
  R2.*4 \break
  \mark \markup { \raise #1.2 \with-color #red \larger \musicglyph "scripts.varsegno" \box \bold "A"}
  \repeat unfold 2 { r8 c c c c d | d c c c c d | 2. | } \break
  r8 g, a bes c d | es2. |
  r8 a, a a d d | bes2. |
  r4 bes8 8 8 8 | 2. |
  r8 a a a c bes | g2. \bar "||" \break %\mark #2
  \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \bold \box B
  g2. | a | a | bes | bes | c | c4 d es | d2 bes4 | \break
  g2. c2 a4 | fis4 g a | g2.~ | 4 r2 \bar "|." \break
  \doubleMark
  \markup {\with-color #red \bold "D.S. al Coda"}
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  r8 c c c c d | d c c c c d | 2.~ | 2.~ | 2. \fermata

  \bar ".."
}

chordsRhythm = \relative c' {
  \clef "treble_8" \key bes \major \time 3/4
  \repeat unfold 9 { r4 <a d> <bes d> } \repeat unfold 2 { r4 <g c > <g d> }
  r4 <c es g> q | r4 <c d g> <c d fis> r <bes d a'> <bes d g> r q <bes d f>
  r <f bes f'> <f bes es> r <a c g'><a c fis> r <g bes d> q
  r <g bes es> <g bes d> r <a c es><a d> r <a c es><a d> r <g bes es><g bes d>
  r <bes d f> q r <g bes es> q <a c es> <bes d f> <c es g> r <bes d f> <d f bes>
  r <bes es g> <bes d g> r <c es g> q <a c fis> <a c g> <a c fis a>
  \repeat unfold 6 { r4 <a d> <bes d> } <bes d>2. \fermata

}

Basse = \relative c' {
  \clef "bass" \key bes \major \time 3/4
  \mark \markup \box \bold Intro
  \repeat unfold 4 { g2. } \break
  \mark \markup { \raise #1.2 \with-color #red \larger \musicglyph "scripts.varsegno" \box \bold "A"}
  \repeat unfold 2 { g2. } \repeat unfold 3 { f2. } es2. \break
  es a d, g f es d g
  \bar "||" \break %\mark #2
  \doubleMark
  \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  \markup \bold \box B
  g fis fis g g c f,4 g a | bes2. \break
  es,4 es' d | a2. | d,4 e fis g2. g,
  \bar "|." \break
  \doubleMark
  \markup {\with-color #red \bold "D.S. al Coda"}
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  g'2. g g g g \fermata
  \bar ".."
}

IntroRS =  \relative c' {
  \clef "bass" \key bes \major \time 3/4
  <<
    \repeat unfold 4 { r4 <a d> <bes d> }  \\
    \repeat unfold 4 { g,2. }
  >>
}
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          \theNotes \\ { s2.*31 \pageBreak }
        >>
        \new Staff \IntroRS
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
         { \transpose c d \theNotes } \\ { s2.*31 \pageBreak }
        >>
        \new Staff \IntroRS
      >>
     }
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          { \transpose c a, \theNotes } \\ { s2.*31 \pageBreak }
        >>
        \new Staff \IntroRS
      >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \IntroRS
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \IntroRS
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a, \theNotes
        >>
        \new Staff \IntroRS
      >>
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )
%           \override ParenthesesItem.extra-offset = #'(10 . -1 )
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \grille
%       >>
% } } }

\book {
  \paper { %page-count = #1
  system-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 10)
                            (padding . 1))
  #(set-paper-size "a4")}
  \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
  \bookpart {
    #(define output-suffix "RSa4")
    \score {
      <<
        \new Staff
        <<
          \set Staff.instrumentName = "Guitar"
          \new Voice = "Mel" { \chordsRhythm }
        >>
        \new ChordNames \harmonies
        \new Staff
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass_8" \Basse }
        >>
      >>
} } }

\book {
  \paper { page-count = #2
  system-system-spacing = #'((basic-distance . 15)
                            (minimum-distance . 10)
                            (padding . 1))
  #(set-paper-size "tablette")}
  \bookpart {
    #(define output-suffix "RSTab")
    \score {
      <<
        \new Staff
        <<
          \set Staff.instrumentName = "Guitar"
          \new Voice = "Mel" { \chordsRhythm }
        >>
        \new ChordNames \harmonies
        \new Staff
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass_8" \Basse }
        >>
      >>
} } }