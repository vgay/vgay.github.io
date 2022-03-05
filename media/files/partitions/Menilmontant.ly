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

title = #"Menilmontant"
composer = #"Charles trenet"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"
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
  s2. bes1*2:7+ bes:m7+ f:7/a as:dim7
  g1:m7 a:7 d:m7 a:7 d:m7 g:7 c:7 f:7
  f2:6 d:m6 g:7 c:7 f1*2:6
  a1:m7 e:7 a1:m7 e:7
  c2:7 des:dim7 d:m7 g:7 g1:m7 c2:7 f:7
  bes1*2:7+ bes:m7+ f:7/a as:dim7
  g1:m7 a:7 d:m7 a:7
  f2:6 d:m6 g:7 c:7 f1*2:6
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \partial 2.
  a4  a  g
  \repeat volta 2
  {
    \mark #1 d2.  a'4 | % 3
    a2.  g4 | % 4
    des2  des~ | % 5
    des4  a' a g |  \break % 6
    c,2.  g'4 | % 7
    g2.  f4 | % 8
    b,1~ | % 9
    b4  f'  f  d |  \break
    f2  d4  f | % 11
    a2.  g4 | % 12
    f4  d2  f4 |
    a2.  g4 | \break % 14
  }
  \alternative
  {
    {
      f4  d2  f4 | % 15
      g2  a | % 16
      c1~ | % 17
      c4  a  a  g |  \break }
    {
      f4  d2  f4 | % 31
      g2  a | % 32
      f1~ | \mark \markup fine
      f4  a  g  f |
    }
  }
  \break  % 34
  \mark #2  e2  e~ | % 35
  e4  f  e  f | % 36
  e1~ | % 37
  e4  e  f  fis | \break % 38
  g2  g~ | % 39
  g4  d  e  f |
  g4  a  a  g | % 41
  g4  a  a  g \bar "||"  \break
  \mark #1  d2.  a'4 | % 43
  a2.  g4 | % 44
  des2  des~ | % 45
  des4  a'  a  g | \break % 46
  c,2.  g'4 | % 47
  g2.  f4 | % 48
  b,1~ | % 49
  b4  f'  f  d | \break
  f2  d4  f | % 51
  a2.  g4 | % 52
  f4  d2  f4 | % 53
  a2.  g4 | \break % 54
  f4  d2  f4 | % 55
  a2  a | % 56
  f1~ | % 57
  f1
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key es \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 { bes1:7+ } \repeat percent 2 { bes:m7+ } \break
  \repeat percent 2 { f:7/a } \repeat percent 2 { as:dim7 }  \break
  g:m7 a:7 d:m7 a:7 \break
  \set Score.repeatCommands = #'((volta "1.") )
  d:m7 g:7 c:7 f:7 \break
  \set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
  \/f2:6 d:m6 \/g:7 c:7 \repeat percent 2 { f1:6 } \break
  \set Score.repeatCommands = #'((volta #f)) \bar "||"
  a1:m7 e:7 a1:m7 e:7 \break
  \/c2:7 des:dim7 \/d:m7 g:7 g1:m7 \/c2:7 f:7 \break
  \repeat percent 2 { bes1:7+ } \repeat percent 2 { bes:m7+ } \break
  \repeat percent 2 { f:7/a } \repeat percent 2 { as:dim7 }  \break
  g:m7 a:7 d:m7 a:7 \break
  g:m7 a:7 d:m7 a:7 \break
  \/f2:6 d:m6 \/g:7 c:7 \repeat percent 2 { f1:6 }
  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*19
  s1 ^\markup \bold \box \fontsize #5 B s1*7
  s1 ^\markup \bold \box \fontsize #5 A
}

verse = \lyricmode {
  Mé -- nil -- mon -- tant mais oui ma -- da -- me __
  C'est là que j'ai lais -- sé mon cœur __
  C'est là que je viens re -- trou -- ver mon â -- me
  Toute ma flam -- me
  Tout mon bon -- heur __
  Quand je re \repeat unfold 9 { \markup \null }
  con -- tent __
  Comme au -- tre -- fois __
  De jo -- lis con -- tes __
  Beaux jours pas -- sés je vous re -- vois
  Un ren -- dez -- vous
  U -- ne mu -- si -- que __
  Des yeux rê -- veurs tout un ro -- man __
  Tout un ro -- man d'a -- mour po -- é -- ti -- que et pa -- thé -- ti -- que
  Mé -- nil -- mon -- tant! __

}

verseB = \lyricmode {
  \repeat unfold 2 { \skip 1 }
  "  " -- vois ma p'tite é -- gli -- se __
  Où les ma -- riages al -- laient gaie -- ment __
  Quand je re -- vois ma vieill' mai -- son gri -- se __
  Où mêm' la \repeat unfold 9 { \skip 1  }bri -- se
  Par -- le d'an -- tan
  Elles me ra -- "  "
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\ { s2. s1*20 \pageBreak }
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \\ { s2. s1*20 \pageBreak }
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes \\ { s2. s1*20 \pageBreak }
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
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
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
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
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }



% \book {
%   \paper { %page-count = #1
%     #(set-paper-size "a4")}
%   \bookpart {
%     #(define output-suffix "Vocala4")
%     \score {
%       <<
%         \new ChordNames {
%           \harmonies
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = \CleSol
%           \new Voice = "Mel" { \theNotes \pageBreak }
%           \addlyrics \verse
%           \addlyrics \verseB
%         >>
%
%       >>
%
%     }
%
%
%
%   De mille échos
%   La midinette fait sa dînette au bistro
%   La pipelette
%   Lit ses journaux
%   Voici la grille verte
%   Voici la porte ouverte
%   Qui grince un peu pour dire « Bonjour bonjour
%   Alors te v'là de retour ? »
%     \markup {
%       \vspace #5
%       \fill-line {
%         \column {
%           \line { 2- }
%           \line { Quand midi sonne }
%           \line { La vie s'éveille à nouveau }
%           \line { Tout résonne }
%           \line { Mais dont la svelte silhouette  }
%           \line { Est si gracieuse et fluette  }
%           \line { Qu'on en demeure épanoui. }
%
%         }
%
%       }
%     }
% } }